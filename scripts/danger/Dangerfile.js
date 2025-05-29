const { danger, fail, warn, message } = require('danger');

// Check PR title format
const prTitle = danger.github.pr.title;
if (!prTitle.match(/^(feat|fix|docs|style|refactor|test|chore)(\(.+\))?: .+/)) {
  fail('PR title should follow conventional commits format: type(scope): description');
}

// Check for large PRs
const bigPRThreshold = 500;
if (danger.github.pr.additions + danger.github.pr.deletions > bigPRThreshold) {
  warn('This PR is quite large. Consider breaking it into smaller PRs.');
}

// Check for missing tests
const hasAppChanges = danger.git.modified_files.some(file => file.includes('lib/'));
const hasTestChanges = danger.git.modified_files.some(file => file.includes('test/'));

if (hasAppChanges && !hasTestChanges) {
  warn('You have app changes but no test changes. Consider adding tests.');
}

// Check for missing description
if (danger.github.pr.body.length < 10) {
  fail('Please provide a meaningful description for this PR.');
}

// Encourage smaller commits
if (danger.git.commits.length > 10) {
  warn('This PR has many commits. Consider squashing some of them.');
}

// Check for direct pushes to master (shouldn't happen with branch protection)
if (danger.github.pr.base.ref === 'master' && danger.github.pr.head.ref === 'master') {
  fail('Direct pushes to master are not allowed. Please create a feature branch.');
}
