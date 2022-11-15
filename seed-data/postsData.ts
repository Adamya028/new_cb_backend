const data = ['Competition', 'Polls and Surveys', 'Infographics', 'Videos', 'Livestreams']

export const posts = data.map((post) => {
  return {
    streamActivityId: post,
  }
})
