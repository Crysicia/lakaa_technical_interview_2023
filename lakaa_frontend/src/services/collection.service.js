import axios from 'axios';
import * as constants from '../constants';

class CollectionService {
  constructor() {
    this.api = axios.create({
      baseURL: constants.API_URL,
      headers: {
        'Content-Type': 'application/json',
      },
    });
  }

  async findAll() {
    const response = await this.api.get('/collections');
    return response.data;
  }

  async findOne(id) {
    const response = await this.api.get(`/collections/${id}`);
    return response.data;
  }

  async create(collection) {
    return this.api.post('/collections', {
      collection
    });
  }
}

export default new CollectionService();
