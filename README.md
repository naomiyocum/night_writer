# Night Writer

![GitHub language count](https://img.shields.io/github/languages/count/naomiyocum/night_writer)
![GitHub top language](https://img.shields.io/github/languages/top/naomiyocum/night_writer?color=yellow)

<img width="780" alt="Screen Shot 2022-11-16 at 11 29 13 AM" src="https://user-images.githubusercontent.com/102825498/202263350-67eaf0ef-d584-49fd-a75a-6ba80c763acc.png">

## Table of contents
* [General Info](#general-info)
* [Learning Goals](#learning-goals)
* [Technologies](#technologies)
* [Usage](#usage)
  * [English to Braille](#english-to-braille)
  * [Braille to English](#braille-to-english)

## General Info
Night Writer was a solo project assigned to us during week 5 of Mod 1 of 4 in Turing's School of Software & Design.
Our challenge was to create a program that translates English to Braille and Braille back to English.<br><br>
The idea of [Night Writing](https://en.wikipedia.org/wiki/Night_writing) was first developed for Napoleon’s army so soldiers could communicate silently at night without light.
The concept of night writing led to Louis Braille’s development of his [Braille tactile writing system](https://en.wikipedia.org/wiki/Braille).


## Learning Goals
* Practice breaking a program into logical components
* Testing components in isolation and in combination
* Applying Enumerable techniques in a real context
* Reading text from and writing text to files

## Technologies
* Ruby 2.7
* RSpec
* Pry
* SimpleCov
* Git
* Atom

## Usage
In your terminal, run `git clone` with the copied URL onto your local machine and navigate into the `night_writer` directory. Now, we can start doing some translations!

### English to Braille
Open the `message.txt` file and update it with the message you would like to translate to Braille.<br>Return to your terminal and run the following command:
```
$ ruby ./lib/night_writer.rb message.txt braille.txt
```
You should see a return message similar to `Created 'braille.txt' containing 37 characters` indicating the translation was completed successfully.
You can view the translation in the `braille.txt` file.

### Braille to English
To translate back to English, run this following command in your terminal:
```
$ ruby ./lib/night_reader.rb braille.txt og_message.txt
```
You should see a return message similar to `Created 'og_message.txt' containing 202 characters` indicating the translation back to English was completed successfully.
You can view the translation in the `og_message.txt` file.

