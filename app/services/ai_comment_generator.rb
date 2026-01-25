require "json"

class AiCommentGenerator
  MODEL = "gpt-4.1".freeze

  KEYS = %w[
    task_created_comment
    task_updated_comment
    task_deleted_comment
    task_completed_comment
    sub_task_completed_comment
    task_incomplete_comment
  ].freeze

  def initialize(api_key = ENV["OPENAI_API_KEY"] || Rails.application.credentials.dig(:openai, :api_key))
    @ai_client = OpenAI::Client.new(access_token: api_key)
  end

  def generate_and_save_all(oshi_profile)
    ai_comment = oshi_profile.build_ai_comment

    attrs = generate_comments_hash(oshi_profile)
    ai_comment.assign_attributes(attrs)
    ai_comment.save!
  end

  private

  def generate_comments_hash(oshi_profile)
    profile_info = <<~TEXT
      名前: #{oshi_profile.name}
      性格: #{oshi_profile.personality}
      年齢: #{oshi_profile.generation}
      性別: #{oshi_profile.gender}
      一人称: #{oshi_profile.pronoun}
    TEXT

    prompt = <<~PROMPT
      あなたは次のプロフィールの「推し本人」として話します。
      読者は「ユーザー本人」です。必ずユーザーに向けて話しかけてください。
    
      出力は **必ずJSONのみ**（前後に文章を付けない）で返してください。
      キーは次の6つを必ず含めてください:
      #{KEYS.join(", ")}
    
      各値（セリフ）のルール:
      - 50文字以内、1文（長くても2文まで）
      - 一人称はプロフィールの一人称を必ず使う
      - 文末は自然な口調（性格に合わせる）
      - ユーザーに向けた呼びかけ・共感・励ましを必ず含める
      - 状況説明は禁止（例:「タスクを作成して〜」みたいな説明文NG）
      - 「頑張る」という単語はできるだけ使わず、別表現に言い換える
      - セリフ内で「ユーザー」という単語は絶対に使わない
      - 呼びかけは「あなた」「君」など自然な表現にする
      - 絵文字は禁止
    PROMPT

    response = @ai_client.chat(
      parameters: {
        model: MODEL,
        temperature: 0.5,
        messages: [
          { role: "system", content: prompt },
          { role: "user", content: profile_info }
        ]
      }
    )

    text = response.dig("choices", 0, "message", "content").to_s
    payload = JSON.parse(text)

    attrs = payload.slice(*KEYS)
    KEYS.each { |k| attrs[k] = "AIコメントの生成に失敗しました。" if attrs[k].blank? }

    attrs
  rescue JSON::ParserError
    KEYS.index_with { "AIコメントの生成に失敗しました。" }
  end
end
