const express = require('express');
const fs = require('fs');
const path = require('path');
const app = express();
const port = 3000;

app.use(express.json());
app.use(express.urlencoded({ extended: true }));
app.use(express.static('public'));

const dataPath = path.join(__dirname, 'data.json');

const readData = () => JSON.parse(fs.readFileSync(dataPath, 'utf8'));
const writeData = (data) => fs.writeFileSync(dataPath, JSON.stringify(data, null, 4));

app.get('/api/users', (req, res) => {
    res.json({ data: readData() });
});

app.post('/api/users', (req, res) => {
    const users = readData();
    const newId = users.length > 0 ? Math.max(...users.map(u => u.id)) + 1 : 1;
    const newUser = { id: newId, ...req.body };
    users.push(newUser);
    writeData(users);
    res.json({ success: true });
});

app.put('/api/users/:id', (req, res) => {
    let users = readData();
    const id = parseInt(req.params.id);
    const index = users.findIndex(u => u.id === id);

    if (index !== -1) {
        users[index] = { id, ...req.body };
        writeData(users);
        res.json({ success: true });
    } else {
        res.status(404).json({ error: "Data tidak ditemukan" });
    }
});

app.delete('/api/users/:id', (req, res) => {
    let users = readData();
    const filteredUsers = users.filter(u => u.id !== parseInt(req.params.id));
    writeData(filteredUsers);
    res.json({ success: true });
});

app.listen(port, () => console.log(`Server berjalan di http://localhost:${port}`));