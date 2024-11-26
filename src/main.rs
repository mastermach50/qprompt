use iced::widget::{button, center, checkbox, column, row, text_input, Checkbox};
use iced::{window, Alignment, Task};
use iced::{Element, Size, Theme};

pub fn main() -> iced::Result {
    // Display the version details and exit
    let args: Vec<String> = std::env::args().collect();
    if args.contains(&"-v".to_string()) || args.contains(&"--version".to_string()) {
        println!("{} ({})", env!("CARGO_PKG_NAME"), env!("CARGO_PKG_VERSION"));
        println!("by {}", env!("CARGO_PKG_AUTHORS"));
        println!("{}", env!("CARGO_PKG_REPOSITORY"));
        std::process::exit(0);
    }

    let window_settings = window::Settings {
        size: Size::new(400.0, 150.0),
        resizable: false,
        level: window::Level::AlwaysOnTop,
        ..window::Settings::default()
    };

    iced::application("Enter password", Prompt::update, Prompt::view)
        .window(window_settings)
        .theme(|_| Theme::TokyoNight)
        .run_with(Prompt::new)
}

#[derive(Debug, Clone)]
enum Message {
    InputChanged(String),
    SecureInputToggled(bool),
    Submit,
    Cancel,
}

#[derive(Default)]
struct Prompt {
    input: String,
    input_is_secure: bool,
}

impl Prompt {
    // To make sure that the input is hidden at the start
    pub fn new() -> (Self, Task<Message>) {
        (
            Prompt {
                input: String::new(),
                input_is_secure: true,
            },
            text_input::focus("password-input"),
        )
    }

    pub fn update(&mut self, msg: Message) {
        match msg {
            Message::InputChanged(input) => self.input = input,
            Message::SecureInputToggled(state) => self.input_is_secure = !state,
            Message::Submit => {
                println!("{}", self.input);
                std::process::exit(0);
            }
            Message::Cancel => {
                std::process::exit(-1);
            }
        }
    }

    pub fn view(&self) -> Element<Message> {
        let input_field = text_input("Enter password", &self.input)
            .id("password-input")
            .secure(self.input_is_secure)
            .on_input(Message::InputChanged)
            .on_submit(Message::Submit);
        let submit_btn = button("Submit").on_press(Message::Submit);
        let cancel_btn = button("Cancel").on_press(Message::Cancel);
        let show_input_chkbx: Checkbox<Message> =
            checkbox("Show Password", !self.input_is_secure).on_toggle(Message::SecureInputToggled);

        let button_row = row![show_input_chkbx, submit_btn, cancel_btn].spacing(20);

        let content = column![input_field, button_row]
            .align_x(Alignment::End)
            .spacing(20)
            .padding(20);

        center(content).into()
    }
}
