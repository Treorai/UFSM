import colorTable from "../tables/colorTable.json" assert {type: "json"};
import weaponTable from "../tables/weaponTable.json" assert {type: "json"};
import chConfig from "../tables/chartConfigs.json" assert {type: "json"};

export function buildKdaChart(legendData, i){
  let kdacolor = colorTable.g4.falls;
    if(legendData.falls+legendData.suicides > legendData.kos){
      kdacolor = colorTable.g5.main;
    }

    new Chart("KDA #"+i, {
        type: chConfig.type.kda,
        data: {
          labels: ['Kills', 'Deaths', 'Team Kills', 'Suicides'],
          datasets: [{
            data: [legendData.kos, legendData.falls, legendData.teamkos, legendData.suicides],
            backgroundColor: [colorTable.g4.kos, kdacolor, colorTable.g4.tks, colorTable.g4.suicides]
          }]
        },
        options: {
          plugins: {
            legend: {
              align: chConfig.options.labels.align,
              display: chConfig.options.labels.display,
              position: chConfig.options.labels.position
            },
            title: {
              display: chConfig.options.title.display,
              text: chConfig.title.kda
            }
          },
          responsive: chConfig.options.responsive,
          cutout: '4%',
          radius: '95%'
        }
      });

}

export function buildWeaponDmgChart(legendData, i){
    
    new Chart("Weapon Damage Distribution #"+i, {
        type: chConfig.type.dmg,
        data: {
          labels: [weaponTable[legendData.legend_name_key].main, weaponTable[legendData.legend_name_key].off, 'Unarmed', 'Gadgets', 'Thrown Item'],
          datasets: [{
            data: [legendData.damageweaponone, legendData.damageweapontwo, legendData.damageunarmed, legendData.damagegadgets, legendData.damagethrownitem],
            backgroundColor: [colorTable.g5.main, colorTable.g5.off, colorTable.g5.unarmed, colorTable.g5.gadget, colorTable.g5.item]
          }]
        },
        options: {
          scales: {
            r: {
              ticks: {
                display: false
              }
            }
          },
          plugins: {
            legend: {
              align: chConfig.options.labels.align,
              display: chConfig.options.labels.display,
              position: chConfig.options.labels.position
            },
            title: {
              display: chConfig.options.title.display,
              text: chConfig.title.dmg
            }
          },
          responsive: chConfig.options.responsive
        }
      });

}

export function buildKosChart(legendData, i){
    
    new Chart("Weapon KO Distribution #"+i, {
        type: chConfig.type.ko,
        data: {
          labels: [weaponTable[legendData.legend_name_key].main, weaponTable[legendData.legend_name_key].off, 'Unarmed', 'Gadgets', 'Thrown Item'],
          datasets: [{
            data: [legendData.koweaponone, legendData.koweapontwo, legendData.kounarmed, legendData.kogadgets, legendData.kothrownitem],
            backgroundColor: [colorTable.g5.main, colorTable.g5.off, colorTable.g5.unarmed, colorTable.g5.gadget, colorTable.g5.item]
          }]
        },
        options: {
          scales: {
            r: {
              ticks: {
                display: false
              }
            }
          },
          plugins: {
            title: {
              display: chConfig.options.title.display,
              text: chConfig.title.ko
            },
            legend: {
              display: chConfig.options.labels.display,
              align: chConfig.options.labels.align,
              position: chConfig.options.labels.position
            }
          },
          responsive: chConfig.options.responsive
        }
      });

}

export function buildHeldWeaponChart(legendData, i){
  
  new Chart("Weapon Holdtime Distribution #"+i, {
    type: chConfig.type.holdtime,
    data: {
      labels: [weaponTable[legendData.legend_name_key].main, weaponTable[legendData.legend_name_key].off, 'Unarmed'],
      datasets: [{
        label: "Time holding weapons",
        data: [legendData.timeheldweaponone, legendData.timeheldweapontwo, legendData.matchtime-legendData.timeheldweaponone - legendData.timeheldweapontwo],
        //backgroundColor: [colorTable.g5.main, colorTable.g5.off, colorTable.g5.unarmed]
        backgroundColor: 'rgba(88, 149, 163, 0.2)',
        borderColor: 'rgb(88, 149, 163)',
        order: 2
      }]
    },
    options: {
      elements: {
        point: {
          pointRadius: '0'
        }
      },
      plugins: {
        legend: {
          align: chConfig.options.labels.align,
          display: chConfig.options.labels.display,
          position: chConfig.options.labels.position
        },
        title: {
          display: chConfig.options.title.display,
          text: chConfig.title.holdtime
        }
      },
      scales: {
        r: {
          ticks: {
            display: false
          }
        }
      },
      responsive: chConfig.options.responsive
    }
  });

}