import ch.ivyteam.ivy.cm.ContentObjectValue;
import ch.ivyteam.ivy.environment.Ivy;

public class ProcessHelper {

  public static ContentObjectValue getTrustTestDoc(String path) {
    return Ivy.cms().get(path).get().value().get();
  }

}
