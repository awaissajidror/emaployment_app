// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import "@hotwired/turbo-rails"
import "controllers"
import "JQuery"

$(document).ready(function () {
    $('.personal-data-opener').on('click', function () {
        $('.personal-data-modal').show();
    });

    $('.close-personal-data-button').on('click', function () {
        $('.personal-data-modal').hide();
    });

    $('.employment-opener').on('click', function () {
        $('.employment-modal').show();
    });

    $('.close-employment-button').on('click', function () {
        $('.employment-modal').hide();
    });


});