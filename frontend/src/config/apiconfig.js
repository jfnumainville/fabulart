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

  if (response.status === 201) {
    const data = await response.json();
    console.log("The story id is " + data.id)
    return data.id;
  }

  else  {
    throw new Error(`Failed to create story: ${response.statusText}`);
  }

  return await response.json();
};
