import * as sorts from './sorts.js';
import updateGallery from './updateGallery.js';
import * as charts from './charts.js';
let globaldata;
let sortstate = false;

const repliturl = 'https://brawlibserver.treorai.repl.co';

// setup elements
const brawlForm = document.getElementById('inputSubmit');
const steamSearch = document.getElementById('searchRepoButton');
const profilehead = document.getElementById("profilehead");
profilehead.style.display = 'none';

//sorting field
const sortfield = document.getElementById("sortfield");
sortfield.style.display = 'none';
const btn_sbName = document.getElementById("sbName");
const btn_sbLvl = document.getElementById("sbLvl");
const btn_sbKDA = document.getElementById("sbKDA");
const btn_sbWR = document.getElementById("sbWR");

//sorting events
btn_sbName.addEventListener('click', (e) => {
    e.preventDefault();
    btn_sbName.disabled = true;

    sorts.sbName(globaldata.legends, sortstate);
    changeSortState();

    btn_sbName.disabled = false;
});

btn_sbLvl.addEventListener('click', (e) => {
    e.preventDefault();
    btn_sbLvl.disabled = true;

    sorts.sbLV(globaldata.legends, sortstate);
    changeSortState();
    
    btn_sbLvl.disabled = false;
});

btn_sbKDA.addEventListener('click', (e) => {
    e.preventDefault();
    btn_sbKDA.disabled = true;

    sorts.sbKDA(globaldata.legends, sortstate);
    changeSortState();
    
    btn_sbKDA.disabled = false;
});

btn_sbWR.addEventListener('click', (e) => {
    e.preventDefault();
    btn_sbWR.disabled = true;

    sorts.sbWR(globaldata.legends, sortstate);
    changeSortState();
    
    btn_sbWR.disabled = false;
});

//events
steamSearch.addEventListener('click', (e) => {
    e.preventDefault();
    steamSearch.disabled = true;

    //start doing stuff
        let username = document.getElementById('usernameInput').value;
        if(username){
            let bracket = '1v1';
            let region = 'all';
            let page = '1';
            let url = `https://api.brawlhalla.com/rankings/${bracket}/${region}/${page}?name=${username}`;
            getSteamPlayer(url);
        }
    //end stuffs

    steamSearch.disabled = false;
});

brawlForm.addEventListener('click', (e) => {
    e.preventDefault();
    brawlForm.disabled = true;

    //start doing stuff
        let username = document.getElementById('usernameInput').value;
        if(username){
           let url = `https://api.brawlhalla.com/player/${username}/stats`;
            getUserInfo(url);
        }
    //end stuffs

    brawlForm.disabled = false;
});

function updateProfile(data){
    document.getElementById("miuser").textContent=data.name;
    document.getElementById("milvl").textContent=data.level;
    document.getElementById("migames").textContent=data.games;
    document.getElementById("miwins").textContent=`${(100*data.wins/data.games).toFixed(2)}%`;
    }

async function changeSortState(){
    if(sortstate == true){
        sortstate = false;
    } else {sortstate = true}
}

function getUserInfo(url) {
    // Send the HTTP POST request with the data as JSON in the request body
    fetch(repliturl, {
        method: 'POST',
        headers: {
            'Content-Type': 'text/plain'
        },
        body:url
    })
    .then(response => response.json())
    .then(data => {
        // Process the response from Replit
        globaldata = data;
        updateProfile(data);
        updateGallery(data.legends);
    })
    .catch(error => {
        console.error(error);
    });
}

function getSteamPlayer(url) {
    // Send the HTTP POST request with the data as JSON in the request body
    fetch(repliturl, {
        method: 'POST',
        headers: {
            'Content-Type': 'text/plain'
        },
        body:url
    })
    .then(response => response.json())
    .then(data => {
        // Process the response from Replit
        if(data[0]){
            document.getElementById('usernameInput').value = (`${data[0].brawlhalla_id}`);
        } else {
            document.getElementById('usernameInput').value = (``);
        }
    })
    .catch(error => {
        console.error(error);
    });
}