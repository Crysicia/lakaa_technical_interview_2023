import axios from 'axios';
import * as constants from '../constants';

class IndicatorService {
  constructor() {
    this.api = axios.create({
      baseURL: constants.API_URL,
      headers: {
        'Content-Type': 'application/json',
      },
    });
  }

  async findAll() {
    const response = await this.api.get('/indicators');
    return response.data;
  }

  async findOne(id) {
    const response = await this.api.get(`/indicators/${id}`);
    return response.data;
  }

  async create(indicator) {
    return this.api.post('/indicators', {
      indicator
    });
  }

  async update(id, indicator) {
    return this.api.patch(`/indicators/${id}`, {
      indicator
    });
  }
}

export default new IndicatorService();
