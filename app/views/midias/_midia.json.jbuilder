json.extract! midia, :id
json.arquivo rails_blob_url(midia.arquivo)
json.tipo midia.arquivo.blob.content_type
json.arquivo_nome midia.arquivo.filename
