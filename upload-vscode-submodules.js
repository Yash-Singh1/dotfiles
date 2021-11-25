const fs = require('fs');
const { exec } = require('child_process');

function resolveRepo(repo) {
  if (repo.startsWith('github:')) {
    return `https://github.com/${repo.replace(/^github:/, '')}.git`;
  } else if (repo.startsWith('gist:')) {
    return `https://gist.github.com/${repo.replace(/^gist:/, '')}.git`;
  } else if (repo.startsWith('http')) {
    return repo;
  } else if (repo.startsWith('gitlab:')) {
    return `https://gitlab.com/${repo.replace(/^gitlab:/, '')}.git`;
  } else if (repo.startsWith('bitbucket:')) {
    return `https://bitbucket.com/${repo.replace(/^bitbucket:/, '')}.git`;
  } else {
    return `https://github.com/${repo}.git`;
  }
}

fs.rm('.vscode', { recursive: true, force: true }, () => {
  fs.mkdirSync('.vscode');
  fs.mkdirSync('.vscode/extensions');

  fs.readdirSync(process.env.HOME + '/.vscode/extensions').forEach((dir) => {
    const packageJSON = require(process.env.HOME + '/.vscode/extensions/' + dir + '/package.json');

    if (packageJSON.repository) {
      exec(
        'git submodule add ' +
          resolveRepo(typeof packageJSON.repository === 'string' ? packageJSON.repository : packageJSON.repository.url) +
          ' .vscode/extensions/' +
          dir
      );
    } else {
      fs.mkdirSync('.vscode/extensions/' + dir);
      if (fs.existsSync(process.env.HOME + '/.vscode/extensions/' + dir + '/README.md')) {
        fs.writeFileSync(`.vscode/extensions/${dir}/README.md`, fs.readFileSync(process.env.HOME + '/.vscode/extensions/' + dir + '/README.md'));
      }
      fs.writeFileSync(
        `.vscode/extensions/${dir}/.vsixmanifest`,
        fs.readFileSync(process.env.HOME + '/.vscode/extensions/' + dir + '/.vsixmanifest')
      );
    }
  });
});
