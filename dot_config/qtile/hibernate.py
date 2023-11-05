from libqtile.command.base import expose_command
from libqtile.widget import base

class Hibernate(base._TextBox):
    """
    A button to hibernate system. When clicked, a countdown starts. Clicking
    the button again stops the countdown and prevents system from hibernating.
    """

    defaults = [
        ("default_text", " 󰤄 ", "The text displayed on the button."),
        ("countdown_format", " {} ", "The text displayed when counting down."),
        ("timer_interval", 1, "The countdown interval."),
        ("countdown_start", 5, "The number to count down from."),
    ]

    def __init__(self, **config):
        base._TextBox.__init__(self, "", **config)
        self.add_defaults(Hibernate.defaults)

        self.is_counting = False
        self.text = self.default_text
        self.countdown = self.countdown_start

        self.add_callbacks({"Button1": self.trigger})

    def __reset(self):
        self.is_counting = False
        self.countdown = self.countdown_start
        self.text = self.default_text
        self.timer.cancel()

    def update(self):
        if not self.is_counting:
            return

        self.countdown -= 1
        self.text = self.countdown_format.format(self.countdown)
        self.timer = self.timeout_add(self.timer_interval, self.update)
        self.draw()

        if self.countdown == 0:
            qtile.spawn("systemctl hibernate")
            return

    @expose_command()
    def trigger(self):
        if not self.is_counting:
            self.is_counting = True
            self.update()
        else:
            self.__reset()
            self.draw()
