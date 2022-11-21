// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails
import '@hotwired/turbo-rails';
import 'controllers';
import 'trix';
import '@rails/actiontext';

window.Alpine.start();

const subscribersCheckboxs = document.querySelectorAll('.subscriber-checkbox');

subscribersCheckboxs.forEach((item) => {
  item.addEventListener('click', (e) => {
    fetch(`http://localhost:3000/subscribers/${e.target.id}.json`)
      .then((response) => response.json())
      .then((data) => console.log(data));
  });
});
