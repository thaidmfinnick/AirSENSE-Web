import React from 'react';
import { Link } from 'react-router-dom';
// import './PathDirect.css';

const PathDirect = ({data} ) => {
  let count = true;
  return (
    <div className="path-direct">
      {data.map((item) => {
        if (count) {
          count = false;
          return <Link to={item.link}>{item.title}</Link>;
        } else {
          return (
            <>
              <span>/</span>
              <Link to={item.link}>{item.title}</Link>
            </>
          );
        }
      })}
    </div>
  );
};
export default PathDirect;
