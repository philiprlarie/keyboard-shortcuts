'use strict';

module.exports = {
  extends: ['eslint:recommended', 'prettier'],
  plugins: ['prettier'],
  globals: {
    console: true
  },
  rules: {
    'block-scoped-var': 'error',
    'consistent-return': 'error',
    eqeqeq: 'error',
    'func-style': ['error', 'declaration'],
    'new-parens': 'error',
    'no-console': 'warn',
    'no-debugger': 'warn',
    'no-eval': 'error',
    'no-extend-native': 'error',
    'no-implicit-coercion': 'error',
    'no-implied-eval': 'error',
    'no-invalid-this': 'error',
    'no-native-reassign': 'error',
    'no-return-assign': 'error',
    'no-self-compare': 'error',
    'no-shadow-restricted-names': 'error',
    'no-throw-literal': 'error',
    'no-use-before-define': ['error', 'nofunc'],
    'no-useless-call': 'error',
    'no-useless-concat': 'error',
    'no-with': 'error',
    'prettier/prettier': [
      'error',
      {
        singleQuote: true
      }
    ],
    'spaced-comment': ['error', 'always', { markers: ['*', '!'] }],
    strict: 'off'
  }
};
