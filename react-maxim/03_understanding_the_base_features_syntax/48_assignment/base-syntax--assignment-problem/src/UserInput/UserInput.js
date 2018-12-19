import React from 'react';

const userInput = (props) => {
  return (
    <div className="user-input">
      <input 
        onChange={props.nameChanged}
        value={props.name}
      />
    </div>
  )
}

export default userInput;