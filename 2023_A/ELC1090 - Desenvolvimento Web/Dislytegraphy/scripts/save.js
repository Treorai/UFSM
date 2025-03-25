import populate from './load.js';

async function saveData() {
  const groupElements = document.querySelectorAll('.items');
  const groups = [];

  groupElements.forEach(groupElement => {
    const group = {
      name: groupElement.getAttribute('id'),
      items: [],
    };

    const itemElements = groupElement.querySelectorAll('.item');
    itemElements.forEach(itemElement => {
      const imgElement = itemElement.querySelector('img');
      const itemURL = './src/' + imgElement.src.split('src/')[1];
      group.items.push(itemURL);
    });

    groups.push(group);
  });

  const data = {
    groups: groups,
  };
  
  try {
    fetch('https://dislytedisco.treorai.repl.co', {
  method: 'POST',
  headers: {
    'Content-Type': 'text/plain'
  },
  body: JSON.stringify(data)
})
  .then(response => {
    if (response.ok) {
      console.log('Data stored successfully');
    } else {
      console.log('Error storing data');
    }
  })
  .catch(error => {
    console.log('Error:', error);
  });

  } catch (error) {
    console.error('Error saving data to MongoDB:', error);
  }
}

async function loadData() {
  try {
    const key = '552'
    fetch(`https://dislytedisco.treorai.repl.co?data=${encodeURIComponent(key)}`, {
      method: 'GET',
      headers: {
        'Content-Type': 'text/plain'
      }
    })
      .then(response => {
        if (response.ok) {
          return response.json();
        } else {
          throw new Error('Error loading data');
        }
      })
      .then(data => {
        console.log('Data loaded successfully:');
        // POPULATE WEBSITE
        populate(data);

      })
      .catch(error => {
        console.error('Error:', error);
      });
  } catch (error) {
    console.error('Error loading data from MongoDB:', error);
  }
  
}


const saveButton = document.getElementById('save-button');
saveButton.addEventListener('click', saveData);
const loadButton = document.getElementById('load-button');
loadButton.addEventListener('click', loadData);