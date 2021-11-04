local function set_leftmargin_color()
  for i = 1, #_VIEWS do
    if (_VIEWS[i]==view) then
      _VIEWS[i]:set_fold_margin_color(true, "0x62DD62")
    else
      _VIEWS[i]:set_fold_margin_color(true, "0xE6E6E6")
    end
  end
end
events.connect(events.VIEW_AFTER_SWITCH, set_leftmargin_color)

return {}