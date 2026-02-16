import React, { useEffect, useState } from 'react';
import axios from 'axios';
import Navbar from './Navbar';
import '../styles/Leaderboard.css';

const Leaderboard = () => {
  const [users, setUsers] = useState([]);

  useEffect(() => {
    const fetchUsers = async () => {
      try {
        const response = await axios.get('http://localhost:5000/users');
        setUsers(response.data);
      } catch (error) {
        console.error('Error fetching users:', error);
      }
    };

    fetchUsers();
  }, []);

  return (
    <>
      <Navbar /><br /><br />
      <div className="leaderboard-container">
        <h1 className="page-title">Leaderboard</h1>
        <div className="leaderboard-list">
          {users.length > 0 ? (
            users.map((user, index) => (
              <div key={user._id} className="leaderboard-item">
                <span className="leaderboard-rank">{index + 1}</span>
                <span className="leaderboard-name">{user.name}</span>
                <span className="leaderboard-xp">{user.xp} XP</span>
              </div>
            ))
          ) : (
            <p className="no-users">No users found.</p>
          )}
        </div>
      </div>
    </>
  );
};

export default Leaderboard;