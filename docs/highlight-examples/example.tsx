import axios from 'axios'
import React, { useState } from 'react'

console.log('hello world')

interface Props {
  title: string
  children: React.ReactNode
}

const NAME: string = 'Cesar'

console.log(NAME)

function Card({ title, children }: Props) {
  const [isExpanded, setIsExpanded] = useState(false)

  const toggleExpansion = () => {
    setIsExpanded(!isExpanded)
  }

  return (
    <div className="card" onClick={toggleExpansion}>
      <div className="card-title">{title}</div>
      {isExpanded && <div className="card-body">{children}</div>}
    </div>
  )
}

export default Card
