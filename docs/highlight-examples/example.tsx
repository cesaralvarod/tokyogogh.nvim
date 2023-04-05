import React, { useState } from 'react'

interface Props {
  title: string
  children: React.ReactNode
}

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
