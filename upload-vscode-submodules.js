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
  } else if (repo.startsWith('git@github.com:')) {
    return `https://github.com/${repo.slice('git@github.com:'.length)}`
  } else {
    return `https://github.com/${repo}.git`;
  }
}

fs.readdirSync('.vscode/extensions').forEach((dir) => {
  if (fs.existsSync(`${process.env.HOME}/.vscode/extensions/${dir}`)) return;

  fs.writeFileSync(
    '.gitmodules',
    fs
      .readFileSync('.gitmodules', 'utf-8')
      .replace(
        `
[submodule ".vscode/extensions/${dir}"]
\tpath = .vscode/extensions/${dir}
\turl`,
        '\n'
      )
      .replace(/^ = .*?$/m, '')
      .replace('\n\n', '\n')
  );
  fs.rm(`.vscode/extensions/${dir}`, { force: true, recursive: true }, () => {});
});

fs.readdirSync(process.env.HOME + '/.vscode/extensions')
  .filter((object) => object !== '.obsolete')
  .forEach((dir) => {
    if (fs.existsSync(`.vscode/extensions/${dir}`)) return;

    const packageJSON = require(process.env.HOME + '/.vscode/extensions/' + dir + '/package.json');

    if (packageJSON.repository) {
      let command =
        'git submodule add ' +
        resolveRepo(typeof packageJSON.repository === 'string' ? packageJSON.repository : packageJSON.repository.url) +
        ' .vscode/extensions/' +
        dir;
      exec(command, (error, stdout, stderr) => {
        if (error) {
          console.error(`exec error: ${error}`);
          return;
        }
        console.log(`${command}: ${stdout}`);
        console.error(`${command}: !ERR! ${stderr}`);
      });
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
