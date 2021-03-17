module Text

    def print_message(message)
    {
        'exeed_attemp' => "You have exceeded the number of attempts!",
        'pick_role' => "What would you like to be? For code maker press m, for code braker press b.",
        'explain_feedback' => ">>MASTERMIND<<\nThe code maker uses X and 0 to give clues about how good the guess was.\n
        + Each 0 means that one of the guessed color is correct, but is in the wrong place.\n
        + Each X means that one of the guessed color is correct, and is in the right place.\n
        + The order of the 0 and X does not matter.",
        'winn' => "Good job.The code braker winns the game",
        'no_guess' => "None of this colors are in the computer's code. Try again."

    }[message]
    end

end