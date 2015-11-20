defmodule Gmail.Payload do

  defstruct part_id: "",
    mime_type: "",
    filename: "",
    headers: [],
    body: %Gmail.Body{},
    parts: []

  @doc """
  Converts an email payload
  """
  def convert(%{"partId" => part_id,
    "mimeType" => mime_type,
    "filename" => filename,
    "headers" => headers,
    "body" => body,
    "parts" => parts}) do
    %Gmail.Payload{part_id: part_id,
      mime_type: mime_type,
      filename: filename,
      headers: headers,
      body: Gmail.Body.convert(body),
      parts: Enum.map(parts, &Gmail.Payload.convert/1)}
  end

  @doc """
  Converts an email payload
  """
  def convert(%{"partId" => part_id,
    "mimeType" => mime_type,
    "filename" => filename,
    "headers" => headers,
    "body" => body}) do
    %Gmail.Payload{part_id: part_id,
      mime_type: mime_type,
      filename: filename,
      headers: headers,
      body: Gmail.Body.convert(body)}
  end

  @doc """
  Converts an email payload
  """
  def convert(%{"mimeType" => mime_type,
    "filename" => filename,
    "headers" => headers,
    "body" => body,
    "parts" => parts}) do
    %Gmail.Payload{mime_type: mime_type,
      filename: filename,
      headers: headers,
      body: Gmail.Body.convert(body),
      parts: Enum.map(parts, &Gmail.Payload.convert/1)}
  end

  @doc """
  Converts an email payload
  """
  def convert(%{"mimeType" => mime_type,
    "filename" => filename,
    "headers" => headers,
    "body" => body}) do
    %Gmail.Payload{mime_type: mime_type,
      filename: filename,
      headers: headers,
      body: Gmail.Body.convert(body)}
  end


end