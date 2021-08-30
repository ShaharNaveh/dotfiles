local present, colorizer = pcall(require, "colorizer")
if not present then
   return
end


colorizer.setup{
  css = {
      mode = 'background',
  },
  html = {
    mode = 'foreground',
  },
}
