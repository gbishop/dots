"""Improve history access so I can skip over functions"""

from IPython import get_ipython
from prompt_toolkit.application.current import get_app
from prompt_toolkit.enums import DEFAULT_BUFFER
from prompt_toolkit.filters import HasFocus, ViNavigationMode, ViInsertMode, Condition
from prompt_toolkit.key_binding.bindings.named_commands import get_by_name
from prompt_toolkit.keys import Keys


@Condition
def at_bottom():
    app = get_app()
    return app.current_buffer.document.is_cursor_at_the_end


@Condition
def at_top():
    app = get_app()
    return (
        app.current_buffer.document.cursor_position_row == 0
    ) and app.current_buffer.document.is_cursor_at_the_end_of_line


ip = get_ipython()
registry = ip.pt_app.key_bindings
ph = get_by_name("previous-history")
nh = get_by_name("next-history")
registry.add_binding("K", filter=(HasFocus(DEFAULT_BUFFER) & ViNavigationMode()))(ph)
registry.add_binding("J", filter=(HasFocus(DEFAULT_BUFFER) & ViNavigationMode()))(nh)
registry.add_binding(
    Keys.Up, filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode() & at_bottom)
)(ph)
registry.add_binding(
    Keys.Down, filter=(HasFocus(DEFAULT_BUFFER) & ViInsertMode() & at_top)
)(nh)
