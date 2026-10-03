$listener = [System.Net.HttpListener]::new()
$listener.Prefixes.Add('http://localhost:8000/')
$listener.Start()
$root = (Get-Location).Path

try {
  while ($listener.IsListening) {
    $context = $listener.GetContext()
    $relative = [Uri]::UnescapeDataString($context.Request.Url.AbsolutePath.TrimStart('/'))
    if ([string]::IsNullOrWhiteSpace($relative)) { $relative = 'index.html' }
    $relative = $relative.Replace('/', '\')
    $file = [System.IO.Path]::GetFullPath((Join-Path $root $relative))
    if (-not $file.StartsWith($root, [System.StringComparison]::OrdinalIgnoreCase) -or -not (Test-Path -LiteralPath $file -PathType Leaf)) {
      $context.Response.StatusCode = 404
      $context.Response.Close()
      continue
    }
    $contentTypes = @{
      '.html' = 'text/html; charset=utf-8'; '.css' = 'text/css; charset=utf-8'; '.js' = 'application/javascript; charset=utf-8'
      '.json' = 'application/json; charset=utf-8'; '.jpg' = 'image/jpeg'; '.jpeg' = 'image/jpeg'; '.png' = 'image/png'
      '.svg' = 'image/svg+xml'; '.xlsx' = 'application/vnd.openxmlformats-officedocument.spreadsheetml.sheet'
    }
    $extension = [System.IO.Path]::GetExtension($file).ToLowerInvariant()
    $context.Response.ContentType = if ($contentTypes.ContainsKey($extension)) { $contentTypes[$extension] } else { 'application/octet-stream' }
    $bytes = [System.IO.File]::ReadAllBytes($file)
    $context.Response.ContentLength64 = $bytes.Length
    $context.Response.OutputStream.Write($bytes, 0, $bytes.Length)
    $context.Response.Close()
  }
} finally {
  $listener.Stop()
  $listener.Close()
}
