import React from 'react';
import PropTypes from 'prop-types';
import styles from './component-name.module.scss';

const ComponentName = ({ data: { attr: attr, text: text } }) => {
  return (
    <div className={styles.componentName} attr={attr} data-testid="component-name">
      {text}
    </div>
  );
};

ComponentName.propTypes = {
  attr: PropTypes.string,
  text: PropTypes.string.isRequired,
};

export default ComponentName;

/*
export const ComponentNameQuery = graphql`
  fragment ComponentNameQuery on paragraph__component_name {
    id
  }
`;
// */
