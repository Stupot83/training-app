import axios from 'axios';

export default axios.create({
    baseURL: 'https://api.unsplash.com',
    headers: {
        Authorization: 'Client-ID qQ_MdCp24Mx-URryAGDCJl-JSf9nRO8u0A5Dy1oLa08'
    }
})