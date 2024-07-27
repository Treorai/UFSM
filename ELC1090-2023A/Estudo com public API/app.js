// Get the GitHub username input form
const gitHubForm = document.getElementById('gitHubForm');
const searchRepoButton = document.getElementById('searchRepoButton');

// Listen for submissions on GitHub username input form
gitHubForm.addEventListener('submit', (e) => {
    e.preventDefault();

    let gitHubUsername = document.getElementById('usernameInput').value;
    let repositoryName = document.getElementById('repositorySelect').value;

    if (gitHubUsername && repositoryName) {
        inputSubmit.value = 'Buscando commits...';
        inputSubmit.disabled = true;

        requestRepoCommits(gitHubUsername, repositoryName)
            .then(response => response.json()) // parse response into json
            .then(data => {
                if (data) {
                    let ul = document.getElementById('repoCommits');
                    ul.innerHTML = "";

                    for (let i in data) {
                        let li = document.createElement('li');
                        li.classList.add('list-group-item')

                        let commitDate = new Date(data[i].commit.committer.date).toLocaleString();

                        li.innerHTML = (`
                        <div class='parent'>
                            <div class='child' style="display: inline-block; vertical-align: middle;">
                                <img style="width: 50px; height:50px; border-radius: 12%;" src="${data[i].author.avatar_url}">
                            </div>
                            <div class='child' style="display: inline-block; vertical-align: middle;">
                                <strong>${data[i].author.login}</strong>
                                <br>
                                ${commitDate}
                            </div>
                        </div>
                        <p><br><strong>Commit:</strong> ${data[i].commit.message}</p>
                    `);

                        ul.appendChild(li);
                    }
                }

                inputSubmit.disabled = false;
                inputSubmit.value = 'Buscar';
            })
    }
})

searchRepoButton.addEventListener('click', (e) => {
    e.preventDefault();
    searchRepoButton.disabled = true;
    searchRepoButton.textContent = 'Aguarde';

    let gitHubUsername = document.getElementById('usernameInput').value;

    requestUserRepos(gitHubUsername)
        .then(response => response.json())
        .then(data => {
            //console.log(data)
            let repositorySelect = document.getElementById('repositorySelect');
            repositorySelect.innerHTML = "";
            let selectOptions = '';
            
            for (let i in data) {
                if (data.message === "Not Found") {
                    alert('Usuário não encontrado')
                } else {
                    selectOptions += `<option value="${data[i].name}">${data[i].name}</option>`;
                }
            }

            repositorySelect.disabled = selectOptions ? false : true;
            repositorySelect.innerHTML = selectOptions;

            searchRepoButton.textContent = 'Buscar';
            searchRepoButton.disabled = false;
        })
})

function requestUserRepos(username) {
    // create a variable to hold the `Promise` returned from `fetch`
    return Promise.resolve(fetch(`https://api.github.com/users/${username}/repos`));
}

function requestRepoCommits(username, repo) {
    return Promise.resolve(fetch(`https://api.github.com/repos/${username}/${repo}/commits`));
}
