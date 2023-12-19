local status, comment = pcall(require, 'Comment')

if (not status) then return
  print('Comment is not loaded or installed . Please check configuration file')
end

comment.setup {}
