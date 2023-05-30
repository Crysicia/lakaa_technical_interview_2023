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

  async findAllRequired() {
    const indicators = await this.findAll();
    return indicators.filter(indicator => indicator.required);
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

  async update(indicator) {
    return this.api.patch(`/indicators/${indicator.id}`, {
      indicator
    });
  }

  async remove(indicator) {
    return this.api.delete(`/indicators/${indicator.id}`, {});
  }
}

export default new IndicatorService();
