const expect = require('chai').expect
const server = require('../app/app');

describe('test', () => {
  it('should return a string', () => {
    expect('ci with travis').to.equal('ci with travis');
  });
});