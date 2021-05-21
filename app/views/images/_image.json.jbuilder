json.sgid image.attachable_sgid
json.content render(
  partial: 'active_storage/blobs/blob',
  locals: { blob: image.file.blob },
  formats: %i[html]
)
