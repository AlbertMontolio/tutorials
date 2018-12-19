import React from 'react';

const userOutput = (props) => {
  return (
    <div className="paragraphs">
      <p className="p1">Paragraph 1: {props.userName}</p>
      <p>Paragraph 2</p>
    </div>
    
  )
}

export default userOutput;