import * as chartBuilder from './charts.js'

export default function updateGallery(chars){
    const profilehead = document.getElementById("profilehead");
    const sortfield = document.getElementById("sortfield");

    let ul = document.getElementById('repoCommits');
    ul.innerHTML = "";
    for(let i in chars){
        let li = document.createElement('li');
        li.classList.add('list-group-item');

        li.innerHTML = (`
            <div class='input-group mb-3'>
                <div style="display: grid; vertical-align: middle; margin-left: 4px; width: 124px">
                    <img style="margin: auto; width: 100px; height:auto; border-radius: 0%;" src="./assets/chars/${chars[i].legend_name_key}.webp">
                    <p style="margin: auto"><strong>${chars[i].legend_name_key.toUpperCase()}</strong></p>
                    
                    <p style="margin: auto">Level ${chars[i].level}</p>
                    <p style="margin: auto">${(100*chars[i].wins/chars[i].games).toFixed(2)}% WR</p>
                </div>
                
                <div class="chartBox">
                    <canvas id="KDA #${i}"></canvas>
                </div>
                <div class="chartBox">
                    <canvas id="Weapon Damage Distribution #${i}"></canvas>
                </div>
                <div class="chartBox">
                    <canvas id="Weapon KO Distribution #${i}"></canvas>
                </div>
                <div class="chartBox">
                    <canvas id="Weapon Holdtime Distribution #${i}"></canvas>
                </div>
            </div>
        `);
          
        ul.appendChild(li);
    }
    for (let i in chars){
        chartBuilder.buildKdaChart(chars[i], i);
        chartBuilder.buildWeaponDmgChart(chars[i], i);
        chartBuilder.buildKosChart(chars[i], i);
        chartBuilder.buildHeldWeaponChart(chars[i], i);
    }
    
    sortfield.style.display = 'block';
    profilehead.style.display = 'block';
}