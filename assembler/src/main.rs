use std::{env, fs, path::PathBuf};
use text_io::read;
use colored::Colorize;


/// Changes to the previous directory
fn set_prevdir() -> PathBuf{
    let parent_dir = env::current_dir().expect("Cannot get current directory.");
    let parent_dir = parent_dir.parent().expect("Cannot get parent directory.");

    env::set_current_dir(parent_dir).expect("Perms for the file to change dir is not set.");
    parent_dir.to_path_buf()
}

/// Parses a user's input file in the media directory to the assembler. Returns the filename and the string
fn parse_userfile() -> Result<(String, String), String> {
    let filename_user: String = read!("{}\n");
    let filename_user = filename_user.trim().to_string(); // Trim any whitespace that begrudgingly windows has...
    let filename_path = filename_user.clone();

    let parent_dir = set_prevdir();
    let path_media = parent_dir.join("media");
    
    let path_userfile = path_media.join(&filename_path);
    

    if path_userfile.exists() {
        let contents: String = fs::read_to_string(path_userfile).expect("Please input the correct filename.");
        Ok((filename_user.to_string(), contents))
    } else {
        Err(format!("EOF: {}", path_userfile.display()))
    }
}

fn main() {
    println!("Good Evening, Archers!\nInput a file in the media directory: ");
    let (filename, contents) = parse_userfile().expect("File extraction fails :(");
    println!("{} contents:", filename.bold());
    
    let lines = contents.split('\n');
    let mut line_count = 0;
    for line in lines{
        let mut isa_breakdown = line.trim().splitn(2, ' ');
        let opcode = isa_breakdown.next().unwrap();
        
        if opcode.is_empty() {
            continue;
        }

        if opcode.starts_with('.') {
            print!("{} ({})", opcode.blue().bold(), line_count);
            print!("\n");
            continue;
        } else {
            print!("{}: {}", line_count, opcode.red().bold());
            line_count += 1;
        }

        
        for intermediates in isa_breakdown{
            print!(" {}", intermediates);
        }
        print!("\n");
    }

}
