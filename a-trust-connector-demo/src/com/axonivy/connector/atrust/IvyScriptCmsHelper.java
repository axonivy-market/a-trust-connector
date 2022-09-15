package com.axonivy.connector.atrust;
import ch.ivyteam.ivy.cm.ContentObjectValue;
import ch.ivyteam.ivy.environment.Ivy;

public class IvyScriptCmsHelper {

  public static ContentObjectValue getContentObjectValue(String path) {
    return Ivy.cms().get(path).get().value().get();
  }

}
