module.exports = {
  parser: 'babel-eslint',
  extends: '.eslintrc',
  env: {
    commonjs: false
  },
  plugins: [
    'import'
  ],
  rules: {
    'import/default': 'error',
    'import/export': 'error',
    'import/extensions': 'error',
    'import/first': 'error',
    'import/named': 'error',
    'import/namespace': 'error',
    'import/newline-after-import': 'error',
    'import/no-deprecated': 'error',
    'import/no-duplicates': 'error',
    'import/no-mutable-exports': 'error',
    'import/no-named-as-default': 'error',
    'import/no-named-as-default-member': 'error',
    'import/no-named-default': 'error',
    'import/no-unresolved': ['error', { commonjs: true }],
  }
};
