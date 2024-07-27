var globalpqeunseiusarestruturasdedadosemjs = null;

function dragStart(event) {
    const itemURL = event.target.parentNode.querySelector('img').src;
    const sourceGroup = event.target.parentNode.parentNode.id;
    const itemIndex = Array.from(event.target.parentNode.parentNode.children).indexOf(
        event.target.parentNode
    );
      
    event.dataTransfer.setData('text/plain', itemURL);
    event.dataTransfer.setData('text/group', sourceGroup);
    event.dataTransfer.setData('text/index', itemIndex);
    event.dataTransfer.effectAllowed = 'move';

    globalpqeunseiusarestruturasdedadosemjs = event.target.closest('.items');
}

function dragOver(event) {
    event.preventDefault();
    event.dataTransfer.dropEffect = 'move';
}

function drop(event) {
    event.preventDefault();
  
    const itemURL = event.dataTransfer.getData('text/plain');
    const sourceGroup = event.dataTransfer.getData('text/group');
    const itemIndex = parseInt(event.dataTransfer.getData('text/index'));
  
    const li = document.createElement('li');
    li.className = 'item';
    li.draggable = true;

    li.addEventListener('dragstart', dragStart);

    const img = document.createElement('img');
    img.src = itemURL;
    img.alt = 'Thumbnail';
    img.style.width = '86px';
    img.style.height = '86px';
  
    li.appendChild(img);
  
    const targetGroupElement = event.target.closest('.items');
  
    if (targetGroupElement) {
        // Remove from old group
        const sourceItems = globalpqeunseiusarestruturasdedadosemjs;
        const sourceItem = sourceItems.children[itemIndex];
        if (sourceItem) {
            sourceItems.removeChild(sourceItem);
        }
        
      // Insert into new group
      targetGroupElement.appendChild(li);

      // Save mongodb shenanigans automatic?
    }
}
  