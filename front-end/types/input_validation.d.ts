interface rule {
  text: string;
  validate: Function;
}

type ValidationFunction = () => boolean | string;
