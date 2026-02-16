import React, { useState } from "react";
import Navbar from "./components/Navbar";
import "./styles/AcceptPitch.css";

const AcceptPitch = () => {
  // Sample data for pitches
  const [pitches, setPitches] = useState([
    {
      _id: "1",
      idea: {
        title: "AI-Powered Chatbot",
        description: "A chatbot that uses AI to provide intelligent responses.",
      },
      mentorId: "mentor1",
      status: "pending",
    },
    {
      _id: "2",
      idea: {
        title: "Blockchain-Based Voting System",
        description: "A secure and transparent voting system using blockchain technology.",
      },
      mentorId: "mentor2",
      status: "pending",
    },
  ]);

  return (
    <>
      <Navbar /><br /><br />
      <div className="accept-pitch-container">
        <h1 className="page-title">Received Pitches</h1>
        <div className="pitches-list">
          {pitches.length > 0 ? (
            pitches.map((pitch) => (
              <div key={pitch._id} className="pitch-card">
                <h4>Idea Title: {pitch.idea.title}</h4>
                <p>Idea Description: {pitch.idea.description}</p>
                <p>Mentor ID: {pitch.mentorId}</p>
                <p>Status: {pitch.status}</p>
                <button className="accept-button">Accept</button>
                <button className="reject-button">Reject</button>
              </div>
            ))
          ) : (
            <p className="no-pitches">No pitches received yet.</p>
          )}
        </div>
      </div>
    </>
  );
};

export default AcceptPitch;