class AiCommentGenerator
  def initialize(api_key = ENV['OPENAI_API_KEY'] || Rails.application.credentials.dig(:openai, :api_key))
    @ai_client = OpenAI::Client.new(access_token: api_key)
  end

  def generate_and_save_all(oshi_profile)
    ai_comment = oshi_profile.build_ai_comment

    ai_comment.task_created_comment = generate_comment("タスクを作成して頑張る", oshi_profile)
    ai_comment.task_updated_comment = generate_comment("タスクを更新して頑張る", oshi_profile)
    ai_comment.task_deleted_comment = generate_comment("タスクを削除し、次の目標に向けて頑張る", oshi_profile)
    ai_comment.task_completed_comment = generate_comment("タスクを完了させ、頑張った", oshi_profile)
    ai_comment.sub_task_completed_comment = generate_comment("サブタスクを完了させ、頑張った", oshi_profile)
    ai_comment.task_incomplete_comment = generate_comment("タスクを未完了に変更し、もう一度頑張る", oshi_profile)

    ai_comment.save!
  end

  private

  def generate_comment(comment_type, oshi_profile)
    profile_info = <<~TEXT
      名前: #{oshi_profile.name}
      性格: #{oshi_profile.personality}
      年齢: #{oshi_profile.generation}
      性別: #{oshi_profile.gender}
      一人称: #{oshi_profile.pronoun}
    TEXT

    response = @ai_client.chat(
      parameters: {
        model: "gpt-4",
        messages: [
          { role: "system", content: "あなたは以下のプロフィールに基づいた人物です。#{comment_type}人に向けてのセリフのみを、50文字以内で1つ生成してください。" },
          { role: "user", content: profile_info }
        ]
      }
    )
    response.dig("choices", 0, "message", "content") || "AIコメントの生成に失敗しました。"
  end
end
