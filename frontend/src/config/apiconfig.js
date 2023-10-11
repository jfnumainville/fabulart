export const apiEndpoint = import.meta.env.VITE_API_ENDPOINT;

export const createStory = async (userId, title, style) => {
  const url = `${apiEndpoint}/users/${userId}/stories`;
  const response = await fetch(url, {
    method: 'POST',
    headers: {
      'Content-Type': 'application/json',
    },
    body: JSON.stringify({ title, style }),
  });

  if (!response.ok) {
    throw new Error(`Failed to create story: ${response.statusText}`);
  }

  return await response.json();
};
