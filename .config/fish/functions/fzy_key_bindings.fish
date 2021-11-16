function fzy_key_bindings
  
  function fzy-file-widget
    set -l selected_path (find * -type f | fzy)

    if test -n "$selected_path"
      commandline -i $selected_path
      commandline -f repaint
    else
      # FIXME(michalc): this paints a new line when nothing gets selected
      commandline -f repaint
    end
  end

  bind \ct fzy-file-widget
end
