const bcrypt = require('bcryptjs');
const userRepository = require('../repositories/userRepository');
const streakRepository = require('../repositories/streakRepository');
const { generateTokenPair, verifyRefreshToken } = require('../utils/jwt');
const config = require('../config');

const register = async ({ name, email, password }) => {
  const existing = await userRepository.findByEmail(email);
  if (existing) {
    throw { status: 400, message: 'Email already registered' };
  }

  const hashedPassword = await bcrypt.hash(password, 12);
  const user = await userRepository.create({ name, email, password: hashedPassword });

  const tokens = generateTokenPair({ id: user.id, email: user.email });
  await streakRepository.create(user.id);

  return { user, ...tokens };
};

const login = async ({ email, password }) => {
  const user = await userRepository.findByEmail(email);
  if (!user) {
    throw { status: 401, message: 'Invalid email or password' };
  }

  const isValid = await bcrypt.compare(password, user.password);
  if (!isValid) {
    throw { status: 401, message: 'Invalid email or password' };
  }

  const tokens = generateTokenPair({ id: user.id, email: user.email });

  return {
    user: { id: user.id, name: user.name, email: user.email, avatar_url: user.avatar_url },
    ...tokens,
  };
};

const refreshToken = async (token) => {
  try {
    const decoded = verifyRefreshToken(token);
    const user = await userRepository.findById(decoded.id);
    if (!user) {
      throw { status: 401, message: 'User not found' };
    }

    const tokens = generateTokenPair({ id: user.id, email: user.email });
    return tokens;
  } catch (error) {
    if (error.status) throw error;
    throw { status: 401, message: 'Invalid refresh token' };
  }
};

const getProfile = async (userId) => {
  const user = await userRepository.findById(userId);
  if (!user) {
    throw { status: 404, message: 'User not found' };
  }
  return user;
};

const updateProfile = async (userId, data) => {
  const allowedFields = ['name', 'avatar_url'];
  const filteredData = {};
  for (const field of allowedFields) {
    if (data[field] !== undefined) {
      filteredData[field] = data[field];
    }
  }

  const user = await userRepository.update(userId, filteredData);
  return user;
};

const deleteAccount = async (userId) => {
  await userRepository.deleteUser(userId);
};

module.exports = { register, login, refreshToken, getProfile, updateProfile, deleteAccount };
