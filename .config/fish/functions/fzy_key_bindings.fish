function fzy_key_bindings
  
  function fzy-file-widget
    set -l selected_path (find * -type f | fzy)

    commandline -i $selected_path
    commandline -f repaint
  end

  bind \ct fzy-file-widget
end
