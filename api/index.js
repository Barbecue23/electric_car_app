const express = require('express');
const cors = require('cors');
const app = express();

app.use(express.json());
app.use(cors());


const mockUsers = [
    {
        id: 1,
        name: "Comfort",
    },
    {
        id: 2,
        name: "Normal",
    },
    {
        id: 3,
        name: "Performance",
    },
];

// root path
app.get('/', function (req, res) {
    res.send('Hello World from Node.js + Express');
});

// เส้นทางใช้เมธอด GET เพื่อรับข้อมูล mode
app.get('/mode', function (req, res) {
    res.json(mockUsers);
});

// เส้นทางใช้เมธอด POST เพื่อค้นหาข้อมูล mode
app.post('/getmode', function (req, res) {
    const { name } = req.body;
    const foundModes = [];
    mockUsers.forEach(user => {
        user.mode.forEach(mode => {
            if (mode.name === name) {
                foundModes.push(mode);
            }
        });
    });

    if (foundModes.length > 0) {
        res.json({ mode: foundModes }); // ส่งข้อมูล mode ที่พบกลับไป
    } else {
        res.status(404).send("Mode not found"); // ถ้าไม่พบข้อมูล ส่งสถานะ 404 และข้อความว่า "Mode not found" กลับไป
    }
});


app.listen(3000, () => {
    console.log('Server is running on port 3000');
});
