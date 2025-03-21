# frozen_string_literal: true

module ApplicationHelper
  def default_meta_tags
    {
      site: '推しTask',
      title: 'タスクを達成すると、推しから励ましてもらえるサービス',
      reverse: true,
      charset: 'utf-8',
      description: '推しTaskでは、タスクを達成するたびにAIによって生成された推しからの励ましの言葉を貰えます。',
      keywords: 'AI,タスク,タスク管理 ,推し, 推し活',
      canonical: 'https://oshi-task-1.onrender.com',
      separator: '|',
      og:{
        site_name: :site,
        title: :title,
        description: :description,
        type: 'website',
        url: 'https://oshi-task-1.onrender.com',
        image: image_url('ogp.png'),
        local: 'ja-JP'
      },
      twitter: {
        card: 'summary_large_image',
        site: '@obvyamdrss',
        image: image_url('ogp.png')
      }
    }
  end
end
