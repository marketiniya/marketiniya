const { danger, fail, warn, message } = require('danger');

// Safely access PR data
const pr = danger.github.pr;
const git = danger.git;

// Check PR title format
if (pr && pr.title) {
  const prTitle = pr.title;
  // More flexible title format - you can customize this regex (case-insensitive)
  if (!prTitle.match(/^(feat|feature|fix|docs|style|refactor|test|chore|ci|build|perf)(\(.+\))?: .+/i)) {
    fail('PR title should follow conventional commits format: type(scope): description\nExamples: feat: add login, Feature: add new component, fix(auth): resolve token issue, docs: update README');
  }
} else {
  message('⚠️ Could not access PR title for validation');
}

// Check for large PRs
if (pr && typeof pr.additions === 'number' && typeof pr.deletions === 'number') {
  const bigPRThreshold = 500;
  if (pr.additions + pr.deletions > bigPRThreshold) {
    warn('This PR is quite large. Consider breaking it into smaller PRs.');
  }
} else {
  message('⚠️ Could not access PR size information');
}

// Check for missing description
if (pr && pr.body !== undefined) {
  if (pr.body.length < 10) {
    fail('Please provide a meaningful description for this PR.');
  }
} else {
  message('⚠️ Could not access PR description for validation');
}

// Basic file change warnings (only if file data is available)
if (git && git.modified_files && Array.isArray(git.modified_files)) {
  const hasAppChanges = git.modified_files.some(file => file.includes('lib/'));
  const hasTestChanges = git.modified_files.some(file => file.includes('test/'));

//  if (hasAppChanges && !hasTestChanges) {
//    warn('You have app changes but no test changes. Consider adding tests.');
//  }

  message(`📊 Files changed: ${git.modified_files.length}`);
} else {
  message('⚠️ Could not access file change information');
}

// Encourage smaller commits (only if commits data is available)
if (git && git.commits && Array.isArray(git.commits)) {
  if (git.commits.length > 10) {
    warn('This PR has many commits. Consider squashing some of them.');
  }
  message(`📝 Commits in PR: ${git.commits.length}`);
} else {
  message('⚠️ Could not access commit information');
}

// Check for version bump in pubspec.yaml
if (git && git.modified_files && Array.isArray(git.modified_files)) {
  const pubspecChanged = git.modified_files.includes('pubspec.yaml');
  const hasAppChanges = git.modified_files.some(file =>
    file.includes('lib/') && !file.includes('.g.dart') && !file.includes('.freezed.dart')
  );

  if (hasAppChanges && !pubspecChanged) {
    warn('📦 You have app changes but pubspec.yaml was not modified. Consider bumping the version if this includes user-facing changes.');
  } else if (pubspecChanged) {
    message('📦 pubspec.yaml was modified - version may have been updated');
  }
}
