'use strict';

module.exports.hello = (event, context, callback) => {
  const response = {
    statusCode: 200,
    body: JSON.stringify({
      message: `Hello ${process.env.PERSON_TO_SAY_HELLO_TO}!`,
      input: event,
    }),
  };

  callback(null, response);
};
