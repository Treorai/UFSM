import updateGallery from "./updateGallery.js";

export default function sbID(chars){
    //clear table
    let ul = document.getElementById('repoCommits');
    ul.innerHTML = ('');
    //sort table
    var byid = chars.slice(0);
    byid.sort(function(a,b){
        return a.legend_id - b.legend_id;
    });
    updateGallery(byid);
}

export function sbLV(chars, st){
    //clear table
    let ul = document.getElementById('repoCommits');
    ul.innerHTML = ('');
    //sort table
    var byLevel = chars.slice(0);
    byLevel.sort(function(a,b){
        if(st == true){
            return b.level - a.level;
        } else{ return a.level - b.level; }
        
    });
    updateGallery(byLevel);
}

export function sbName(chars, st){
    //clear table
    let ul = document.getElementById('repoCommits');
    ul.innerHTML = ('');
    //sort table
    var byName = chars.slice(0);
    byName.sort(function(a,b){
        var x = a.legend_name_key;
        var y = b.legend_name_key;
        if(st == true){
            return x < y ? -1 : x > y ? 1 : 0;
        } else { return y < x ? -1 : y > x ? 1 : 0; }
    });
    updateGallery(byName);
}

export function sbWR(chars, st){
    //clear table
    let ul = document.getElementById('repoCommits');
    ul.innerHTML = ('');
    //sort table
    var byWR = chars.slice(0);
    byWR.sort(function(a,b){
        let wra = (100*a.wins/a.games).toFixed(2);
        let wrb = (100*b.wins/b.games).toFixed(2);
        if(st == true){
            return wrb - wra;
        } else { return wra - wrb }
    });
    updateGallery(byWR);
}

export function sbKDA(chars, st){
    //clear table
    let ul = document.getElementById('repoCommits');
    ul.innerHTML = ('');
    //sort table
    var byKDA = chars.slice(0);
    byKDA.sort(function(a,b){
        let kda = (a.kos/(a.falls+a.suicides)).toFixed(2);
        let kdb = (b.kos/(b.falls+b.suicides)).toFixed(2);
        if(st == true){
            return kdb - kda;
        } else { return kda - kdb }
    });
    updateGallery(byKDA);
}
