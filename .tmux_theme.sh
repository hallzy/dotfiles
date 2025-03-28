#### COLOUR

tm_icon="☀"
tm_color_active=colour82
tm_color_inactive=colour244
tm_color_feature=colour10
tm_color_music=colour10
tm_active_border_color=colour10

tm_color_time=colour9
tm_color_day=colour190
tm_color_date=colour150

tm_color_window_names_fg=colour172
tm_color_window_names_bg=colour238
tm_color_status_bg=colour234

# separators
tm_separator_left_bold="◀"
tm_separator_left_thin="❮"
tm_separator_right_bold="▶"
tm_separator_right_thin="❯"

set -g status-left-length 32
set -g status-right-length 150
set -g status-interval 5


# default statusbar colors
set-option -g status-fg $tm_color_active
set-option -g status-bg $tm_color_status_bg
set-option -g status-attr default

# default window title colors
set-window-option -g window-status-fg $tm_color_inactive
set-window-option -g window-status-bg $tm_color_status_bg
set -g window-status-format "#I #W"

# active window title colors
set-window-option -g window-status-current-fg $tm_color_window_names_fg
set-window-option -g window-status-current-bg $tm_color_window_names_bg
set-window-option -g  window-status-current-format "#[bold]#I #W"

# pane border
set-option -g pane-border-fg $tm_color_inactive
set-option -g pane-active-border-fg $tm_active_border_color

# message text
set-option -g message-bg default
set-option -g message-fg $tm_color_active

# pane number display
set-option -g display-panes-active-colour $tm_color_active
set-option -g display-panes-colour $tm_color_inactive

# clock
set-window-option -g clock-mode-colour $tm_color_active

# example: 10:34 PM - Monday - May 16
tm_time="#[fg=$tm_color_time,bold]%l:%M %p"
tm_day="#[fg=$tm_color_day,bold]%A"
tm_date="#[fg=$tm_color_date,bold]%b %d"
tm_host="#[fg=$tm_color_feature,bold]#h"
tm_session_name="#[fg=$tm_color_feature,bold]$tm_icon#S$tm_icon"

set -g status-left $tm_session_name'  '
set -g status-right $tm_itunes' '$tm_time' '$tm_day' '$tm_date' '$tm_host

